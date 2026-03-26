from fastapi import APIRouter, Depends
from sqlalchemy.orm import Session
from app.db.database import get_db
from app.services.user_service import create_user, authenticate_user

router = APIRouter()

@router.post("/register")
def register(user: dict, db: Session = Depends(get_db)):
    return create_user(db, user)

@router.post("/login")
def login(user: dict, db: Session = Depends(get_db)):
    return authenticate_user(db, user)

@router.get("/profile")
def profile():
    return {"message": "Protected route"}
