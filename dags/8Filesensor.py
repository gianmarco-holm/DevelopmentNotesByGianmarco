from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator
# importamos la librería
from airflow.sensors.filesystem import FileSensor


with DAG(dag_id="7.3-filesensor",
    description="FileSensor",
    schedule_interval="@daily",
    start_date=datetime(2022, 8, 20),
    end_date=datetime(2022, 8, 25),
    max_active_runs=1
) as dag:

    t1 = BashOperator(task_id="creating_file",
					  bash_command="sleep 10 && touch /tmp/file.txt")
    # Traemos el sensor, para ello debemos crear una conexion con file path en la interfaz de airflow
    # Esto significa que cada vez que encuentre el archivo se va a ejecutar la siguiente tarea, en este caso el archivo es file.txt
    t2 = FileSensor(task_id="waiting_file",
					  filepath="/tmp/file.txt")

    t3 = BashOperator(task_id="end_task",
					  bash_command="echo 'El fichero ha llegado'")

    t1 >> t2 >> t3