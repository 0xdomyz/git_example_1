# %%

import os
from pathlib import Path

import pandas as pd
import sqlalchemy as alc


def run(self: alc.engine.Engine, sql: str) -> pd.DataFrame | None:
    with self.begin() as conn:
        res = conn.execute(alc.text(sql))
        if res.returns_rows:
            return pd.DataFrame(res.all(), columns=res.keys())
    return None


alc.engine.Engine.run = run


def connect() -> alc.engine.Engine:
    password = os.environ.get("password")
    if not password:
        raise RuntimeError("Set env var 'password' before running this script.")

    connection_string = (
        f"teradatasql://demo_user:{password}"
        "@test-l36lujzkc0420a7n.env.clearscape.teradata.com"
    )
    return alc.create_engine(connection_string)


eng = connect()
# %%
try:
    eng.run(f"drop table demo_exposure")
except Exception as e:
    pass
# %% [markdown]
# ## v1
# ####################################################################################################

# %%
qry = f"""
CREATE MULTISET TABLE demo_exposure (
    cut_id INT,
    category VARCHAR(1),
    exposure INT
);
"""
df = eng.run(qry)
df
# %%
qry = f"""
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (1, 'A', 100);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (2, 'A', 200);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (3, 'B', 300);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (4, 'B', 400);
INSERT INTO demo_exposure (cut_id, category, exposure) VALUES (5, 'A', 500);
"""
df = eng.run(qry)
df
# %%
df = eng.run(f"select * from demo_exposure")
df
# %% [markdown]
# ## v2
# ####################################################################################################

# %%
qry = f"""
drop table demo_exposure;
"""
eng.run(qry)
# %%
qry = f"""

CREATE MULTISET TABLE demo_exposure (
    cust_id INT,
    category VARCHAR(1),
    exposure INT
);
"""
eng.run(qry)
# %%
qry = f"""

INSERT INTO demo_exposure (cust_id, category, exposure) VALUES (1, 'A', 100);
INSERT INTO demo_exposure (cust_id, category, exposure) VALUES (2, 'A', 200);
INSERT INTO demo_exposure (cust_id, category, exposure) VALUES (3, 'B', 300);
INSERT INTO demo_exposure (cust_id, category, exposure) VALUES (4, 'B', 400);
INSERT INTO demo_exposure (cust_id, category, exposure) VALUES (5, 'A', 500);

"""
eng.run(qry)
# %%
df = eng.run(f"select * from demo_exposure")
df

# %%
qry = f"""
SELECT COUNT(*) AS row_counts
FROM demo_exposure;

"""
df = eng.run(qry)
df
