from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime

def print_hello():
    print("Hello gente, soy Gianmarco")

with DAG(
    dag_id="pyhtonoperator",
    description="Nuestro primer DAG utilizando Python",
    schedule_interval="@once",
    start_date=datetime(2023, 3, 24)
) as dag:
    t1 = PythonOperator(
        task_id="hello_with_python",
        python_callable=print_hello
    )