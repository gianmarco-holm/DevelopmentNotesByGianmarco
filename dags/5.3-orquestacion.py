from airflow import DAG
from airflow.operators.empty import EmptyOperator
from datetime import datetime

# Usamos un CRON de todos los lunes a las 7am
with DAG(
    dag_id="orquestation3",
    description="Orquestacion con Cron y Preset",
    schedule_interval="@monthly",
    start_date=datetime(2024, 2, 24),
    end_date=datetime(2024,4,24),
) as dag:
    t1 = EmptyOperator(task_id="tarea1")
    t2 = EmptyOperator(task_id="tarea2")
    t3 = EmptyOperator(task_id="tarea3")
    t4 = EmptyOperator(task_id="tarea4")

    t1 >> t2 >> t3 >> t4