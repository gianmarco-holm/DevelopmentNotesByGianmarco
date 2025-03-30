import streamlit as st
import pandas as pd
import networkx as nx
from pyvis.network import Network
import tempfile

# Definir las tablas y su estado
input_tables = {
    "Tabla A (Silver)": "silver",
    "Tabla B (No Formal)": "no_formal",
    "Tabla C (Silver)": "silver",
    "Tabla D (No Formal - No Migrable)": "no_migrable",
    "Tabla E (No Formal - Migrable a Silver)": "migrable",
    "Tabla F (Silver)": "silver",
    "Tabla G (No Formal - Migrable a Silver)": "migrable",
}

# Definir las relaciones de insumos
insumo_relations = {
    "Tabla E (No Formal - Migrable a Silver)": [
        "Tabla H (No Formal)",
        "Tabla I (Silver)",
    ],
    "Tabla G (No Formal - Migrable a Silver)": [
        "Tabla J (No Formal)",
        "Tabla K (Silver)",
    ],
}

# Definir las columnas y sus múltiples orígenes
column_mapping = [
    {
        "Columna Final": "Col1",
        "Tabla Origen": "Tabla A (Silver)",
        "Columna Origen": "A_Col1",
    },
    {
        "Columna Final": "Col1",
        "Tabla Origen": "Tabla B (No Formal)",
        "Columna Origen": "B_Col1",
    },
    {
        "Columna Final": "Col2",
        "Tabla Origen": "Tabla C (Silver)",
        "Columna Origen": "C_Col1",
    },
    {
        "Columna Final": "Col2",
        "Tabla Origen": "Tabla D (No Formal - No Migrable)",
        "Columna Origen": "D_Col1",
    },
    {
        "Columna Final": "Col3",
        "Tabla Origen": "Tabla E (No Formal - Migrable a Silver)",
        "Columna Origen": "E_Col1",
    },
    {
        "Columna Final": "Col3",
        "Tabla Origen": "Tabla F (Silver)",
        "Columna Origen": "F_Col1",
    },
    {
        "Columna Final": "Col4",
        "Tabla Origen": "Tabla G (No Formal - Migrable a Silver)",
        "Columna Origen": "G_Col1",
    },
]

# Convertir a DataFrame
df = pd.DataFrame(column_mapping)

# Agregar estado de la tabla de origen
df["Estado Tabla Origen"] = df["Tabla Origen"].map(input_tables)

# Crear gráfico de red
G = nx.DiGraph()

# Agregar nodos y conexiones
for index, row in df.iterrows():
    G.add_edge(row["Tabla Origen"], "Tabla Final", label=row["Columna Origen"])

for table, insumos in insumo_relations.items():
    for insumo in insumos:
        G.add_edge(insumo, table, label="Insumo")

# Crear visualización interactiva
net = Network(height="600px", width="100%", directed=True)
net.from_nx(G)

# Guardar la visualización temporalmente
temp_file = tempfile.NamedTemporaryFile(delete=False, suffix=".html")
net.save_graph(temp_file.name)

# Streamlit UI
st.title("Mapa de Migración de Datos")
st.write("Visualización interactiva de las relaciones entre tablas y columnas")

st.components.v1.html(
    open(temp_file.name, "r", encoding="utf-8").read(), height=600, scrolling=True
)

# Mostrar tabla con detalles
st.write("## Detalle de Columnas y Tablas")
st.dataframe(df)
