from flask_sqlalchemy import SQLAlchemy
import uuid
from datetime import datetime
from utils.db import db

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(20), unique=True, nullable=False)
    password = db.Column(db.String(20), nullable=False)
    personal_secret = db.Column(db.String(15), default=uuid.uuid4().hex)
    created_at = db.Column(db.DateTime, default=datetime.utcnow)
    
    def __init__(self, username, password):
        self.username = username
        self.password = password

    def __repr__(self):
        return self.username
