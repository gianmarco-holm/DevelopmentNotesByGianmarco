from airflow import DAG
from airflow.operators.bash import BashOperator
from airflow.operators.python import PythonOperator
from datetime import datetime
# Se necesita esta librería
from airflow.utils.trigger_rule import TriggerRule


def myfunction():
    raise Exception

# Aca podemos colocar atributos que pueden afectar a todas las tareas
# Por ejemplo si le agregamos un depend_on_past=False, esto afectaria a todas las tareas
# default_args = {depend_on_past=False}
default_args = {}

# max_active_runs, significa que solo un worker o instancia debe estar trabajando,
# y no trabajan mas de 2 instancias al mismo tiempo
with DAG(dag_id="6.2-monitoring",
        description="Monitoreando nuestro DAG",
        schedule_interval="@daily",
        start_date=datetime(2022, 1, 1),
        end_date=datetime(2022, 6, 1),
        default_args=default_args,
        max_active_runs=1) as dag:

    # Como no depende de  ninguna se le va a dejar como All_Success
    # Retries es la cantidad de intentos que puede hacer una tarea
    # Entre cada intento podemos darle un delay, en este caso 5 seg
    # depends_on_past, si depende si se ejecuto anteriormente la misma tarea, en este caso no importa y por eso es False
    t1 = BashOperator(task_id="tarea1",
                    bash_command="sleep 5 && echo 'Primera tarea!'",
                    trigger_rule=TriggerRule.ALL_SUCCESS,
                    retries=2,
                    retry_delay=5,
                    depends_on_past=False)

    t2 = BashOperator(task_id="tarea2",
                    bash_command="sleep 3 && echo 'Segunda tarea!'",
                    retries=2,
                    retry_delay=5,
                    trigger_rule=TriggerRule.ALL_SUCCESS,
                    depends_on_past=True)

    t3 = BashOperator(task_id="tarea3",
                    bash_command="sleep 2 && echo 'Tercera tarea!'",
                    retries=2,
                    retry_delay=5,
                    trigger_rule=TriggerRule.ALWAYS,
                    depends_on_past=True)

    t4 = PythonOperator(task_id="tarea4",
                    python_callable=myfunction,
                    retries=2,
                    retry_delay=5,
                    trigger_rule=TriggerRule.ALL_SUCCESS,
                    depends_on_past=True)

    t5 = BashOperator(task_id="tarea5",
                    bash_command="sleep 2 && echo 'Quinta tarea!'",
                    retries=2,
                    retry_delay=5,
                    depends_on_past=True)


    t1 >> t2 >> t3 >> t4 >> t5