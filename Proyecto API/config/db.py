from sqlalchemy import create_engine, MetaData 

engine = create_engine('mysql+pymysql://root:efectomariposa@localhost:3306/p1api')

conn = engine.connect()