from __future__ import print_function
import sys
from system.core.model import Model

class User(Model):
	def __init__(self):
		super(User, self).__init__()

	# def get_users(self):
	# 	query = "SELECT * FROM users"
	# 	return self.db.query_db(query, data)

	def get_event_users(self, event_id):
		query = """SELECT * FROM users LEFT JOIN users_has_events 
							ON users.id = user_id WHERE event_id = :event_id
						"""
		data = {'event_id': event_id}
		return self.db.query_db(query, data)		

	def login_user(self, data):
		query = "SELECT * FROM users WHERE id = :id LIMIT 1"
		user = self.db.query_db(query, data)

		# If new user:
		if len(user) == 0:
			# Add user to database:
			query = """INSERT INTO users (id, name, created_at, updated_at)
								VALUES (:id, :name, NOW(), NOW())
							"""
			self.db.query_db(query, data)
			return {'log': ['Thanks for joining, {}! Please enjoy your stay!'.format(data['name'])]}
	
		return {'log': ['Welcome back, {}!'.format(data['name'])]}							