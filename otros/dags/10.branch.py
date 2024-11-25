from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import BranchPythonOperator
from datetime import datetime, date

default_args = {
'start_date': datetime(2022, 8, 20),
'end_date': datetime(2022, 8, 25)
}

# Para python se crea una funcion con la condicion
# si la fecha de la logica es menor al 23 de agosto entonces se ejecutara la tarea finish_22_june sino start_23_june
def _choose(**context):
    if context["logical_date"].date() < date(2022, 8, 23):
        return "finish_22_june"
    return "start_23_june"

with DAG(dag_id="10-branching",
    schedule_interval="@daily",
	default_args=default_args
) as dag:

    branching = BranchPythonOperator(task_id="branch",
	                                 python_callable=_choose)

    finish_22 = BashOperator(task_id="finish_22_june",
	                         bash_command="echo 'Running {{ds}}'")

    start_23 = BashOperator(task_id="start_23_june",
	                        bash_command="echo 'Running {{ds}}'")

    branching >> [finish_22, start_23]