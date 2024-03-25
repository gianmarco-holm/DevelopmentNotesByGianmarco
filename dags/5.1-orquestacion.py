from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

# Tenemos que agregarle el atributo depends_on_past para que no se ejecute en forma paralela
# Para que se ejecute día por día, colocamos active runs
with DAG(
    dag_id="orquestation1",
    description="Orquestacion con Cron y Preset",
    schedule_interval="@daily",
    start_date=datetime(2024, 3, 24),
    end_date=datetime(2024,4,24),
    default_args={"depends_on_past":True},
    max_active_runs=1
) as dag:
    t1 = BashOperator(task_id="tarea1",
                      bash_command="sleep 2 && echo 'Tarea1'")
    t2 = BashOperator(task_id="tarea2",
                      bash_command="sleep 2 && echo 'Tarea2'")
    t3 = BashOperator(task_id="tarea3",
                      bash_command="sleep 2 && echo 'Tarea3'")
    t4 = BashOperator(task_id="tarea4",
                      bash_command="sleep 2 && echo 'Tarea4'")

    t1 >> t2 >> [t3,t4]