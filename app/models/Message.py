from __future__ import print_function
from system.core.model import Model
import sys

class Message(Model):
	def __init__(self):
		super(Message, self).__init__()

	def get_event_messages(self, event_id):
		query = """SELECT *,  messages.id AS id,
							DATE_FORMAT(messages.created_at, '%M %D, %Y (%l:%i %p)') as message_date 
							FROM messages LEFT JOIN users ON user_id = users.id
							WHERE event_id = :event_id ORDER BY messages.created_at DESC
						"""
		data = {'event_id': event_id}
		return self.db.query_db(query, data)	

	def get_event_locations(self, event_id):
		query = """SELECT location FROM messages 
							WHERE event_id = :event_id AND location <> ''
						"""
		data = {'event_id': event_id}
		return self.db.query_db(query, data)	
	
	def post_message(self, event_id, user_id, dat):
		query = """INSERT INTO messages (user_id, event_id, message, location, created_at, updated_at)
							VALUES (:user_id, :event_id, :message, :location, NOW(), NOW())
						"""
		data = {	'user_id': user_id,
							'event_id': event_id,
							'message': dat['message'],
							'location': dat['location']
						}						
		self.db.query_db(query, data)

	def delete_message(self, id):
		query = "DELETE FROM messages WHERE id = :id"
		data = {'id': id}
		self.db.query_db(query, data)

	def delete_user_messages(self, user_id):
		query = "DELETE FROM messages WHERE user_id = :user_id"
		data = {'user_id': user_id}
		self.db.query_db(query, data)		

