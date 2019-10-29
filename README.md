# PotholeFinderEngine

Firing a pothole event
http://localhost:8080/api/pothole/v1/add?userId=3&latitude=1&longitude=1&depth=1

Look for the closest pothole in the given range
http://localhost:8080/api/pothole_summary/v1/get?latitude=1&longitude=1&threshold=10&userId=1

Fetch all the registered potholes
http://localhost:8080/api/pothole_summary/v1/all



ngrok link - will only work when my laptop is ON ;)
http://9494a355.ngrok.io/api/pothole_summary/v1/get?latitude=1&longitude=1&threshold=10&userId=1
