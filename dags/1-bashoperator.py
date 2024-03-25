from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

with DAG(dag_id="bashoperator",
        description="utilizando bash operator",
        start_date=datetime(2024, 3, 24)) as dag:

    t1 = BashOperator(
        task_id="hello_with_bash",
        bash_command="echo 'Hello gente soy gianmarco'"
    )