from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator
from datetime import datetime

def print_hello():
    print("Hello gente, soy Gianmarco")

with DAG(
    dag_id="dependencias",
    description="Usando dependencias entre tareas",
    schedule_interval="@once",
    start_date=datetime(2023, 3, 24)
) as dag:
    t1 = PythonOperator(
        task_id="tarea1",
        python_callable=print_hello
    )
    t2 = BashOperator(
        task_id="tarea2",
        bash_command="echo 'tarea 2'"
    )
    t3 = BashOperator(
        task_id="tarea3",
        bash_command="echo 'tarea 3'"
    )
    t4 = BashOperator(
        task_id="tarea4",
        bash_command="echo 'tarea 4'"
    )

    # Forma 1 de realizar dependencias entre tareas
    # t1.set_downstream(t2)
    # t2.set_downstream([t3,t4])

    # Forma 2 de realizar dependencias entre tareas
    t1 >> t2 >> [t3, t4]