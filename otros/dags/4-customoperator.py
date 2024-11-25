from airflow import DAG
from datetime import datetime
from hellooperator import HelloOperator

with DAG(
    dag_id="customoperator",
    description="Creando un operador personalizado",
    start_date=datetime(2023, 3, 24)
) as dag:
    t1 = HelloOperator(task_id="hello",
                    name="Freddy")