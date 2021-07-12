import falcon
from wsgiref.simple_server import make_server
from pandas_datapackage_reader import read_datapackage

api = falcon.API()

data = read_datapackage("..")

def get_paginated_json(req, df):
    per_page = int(req.get_param('per_page', required=False, default=10))
    page = (int(req.get_param('page', required=False, default=1))-1)*per_page
    return df[page:page+per_page].to_json(orient='records')

class TreeResource:

    def __init__(self, data):
        self.trees = data

    def on_get(self, req, resp):
        df = self.trees.copy()
        for fld in self.trees._metadata['schema']['fields']:
            fn = fld['name']
            q = req.get_param(fn, None)
            if q is not None:
                try:
                    q = q.strip()
                    q = int(q)
                    df = df.loc[df[fn] == q]
                except:
                    pass

        resp.status = falcon.HTTP_200
        resp.body = get_paginated_json(req, df)

api.add_route('/tree', TreeResource(data['csv']))


if __name__ == '__main__':
    with make_server('', 8000, api) as httpd:
        print('Serving on port 8000...')
        httpd.serve_forever()
