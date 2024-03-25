from airflow import DAG
from airflow.decorators import dag
from airflow.operators.empty import EmptyOperator
from datetime import datetime

# Forma 1
with DAG(
    dag_id="dag1",
    description="dag1",
    start_date=datetime(2022, 10, 31),
    schedule_interval="@once",
) as dag1:
    t1 = EmptyOperator(task_id="dummy")

# Forma 2
dag2 = DAG(
    dag_id="dag2",
    description="2dag2",
    start_date=datetime(2022, 10, 31),
    schedule_interval="@once",
)
t2 = EmptyOperator(task_id="dummy2", dag=dag2)

# Forma 3
@dag(
    dag_id="dag3",
    description="dag3",
    start_date=datetime(2022, 10, 31),
    schedule_interval="@once",
)
def generate_dag():
    t3 = EmptyOperator(task_id="dummy3")

dag3 = generate_dag()