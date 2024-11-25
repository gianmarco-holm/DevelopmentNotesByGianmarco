from datetime import datetime
from airflow import DAG
from airflow.operators.bash import BashOperator


# Imprime la fecha actual y el nombre del archivo
templated_command = """
{% for file in params.filenames %}
    echo "{{ ds }}"
	echo "{{ file }}"
{% endfor %}
"""


with DAG(dag_id="8-templating",
    description="Example using templates",
    schedule_interval="@daily",
    start_date=datetime(2022, 8, 10),
    end_date=datetime(2022, 8, 25),
    max_active_runs=1
) as dag:

    t1 = BashOperator(task_id="tarea_1",
					  bash_command=templated_command,
					  params={"filenames": ["file1.txt", "file2.txt"]},
					  depends_on_past=True)

    t1