from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from airflow.models.xcom import XCom

default_args = {"depends_on_past": True}

# Si queremos compartir el output con python, se debe crear una función con context y luego llamar a la columna ti
# ti significa task instance, en este caso se esta llamando al output de la tarea 2 y se resta 24
def myfunction(**context):
    print(int(context["ti"].xcom_pull(task_ids='tarea_2')) - 24)

with DAG(dag_id="9-XCom",
    description="Probando los XCom",
    schedule_interval="@daily",
    start_date=datetime(2022, 1, 1),
	default_args=default_args,
    max_active_runs=1
) as dag:

# Aca mostramos como se realiza el xcom con bash operator, en este caso la tarea 2 llama al resultado de la tarea 1
    t1 = BashOperator(task_id="tarea_1",
					  bash_command="sleep 5 && echo $((3 * 8))")

    t2 = BashOperator(task_id="tarea_2",
					  bash_command="sleep 3 && echo {{ ti.xcom_pull(task_ids='tarea_1') }}")

    t3 = PythonOperator(task_id="tarea_3", 
                        python_callable=myfunction)

    t1 >> t2 >> t3