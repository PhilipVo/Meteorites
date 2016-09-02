from __future__ import print_function
from system.core.model import Model
import sys

class Event(Model):
	def __init__(self):
		super(Event, self).__init__()

	def get_event(self, event_id, user_id):
		query = """SELECT *, IF(user_id = :user_id, TRUE, FALSE) as joined,
							DATE_FORMAT(date, '%M %D, %Y') as date		
							FROM events LEFT JOIN users_has_events
							ON events.id = event_id
		 					WHERE events.id = :event_id LIMIT 1
		 				"""
		data =	{	'event_id': event_id,
							'user_id': user_id
						}
		return self.db.query_db(query, data)[0]

	def get_events(self, user_id):
		query = """SELECT *, IF(user_id = :user_id, TRUE, FALSE) as joined,
							DATE_FORMAT(date, '%M %D, %Y') as date, COUNT(user_id) as count
						 	FROM events LEFT JOIN users_has_events
							ON events.id = event_id
							GROUP BY events.id
							ORDER BY date DESC
						"""
		data =	{'user_id': user_id}		
		return self.db.query_db(query, data)

	def toggle_join(self, user_id, event_id):
		query = """SELECT * FROM users_has_events WHERE user_id = :user_id
							AND event_id = :event_id LIMIT 1
						"""
		data =	{	'user_id': user_id,
							'event_id': event_id
						}

		if len(self.db.query_db(query, data)) == 0:
			query = """INSERT INTO users_has_events (user_id, event_id, created_at, updated_at)
								VALUES (:user_id, :event_id, NOW(), NOW())
							"""
		else:
			query = """DELETE FROM users_has_events WHERE user_id = :user_id
								AND event_id = :event_id LIMIT 1
							"""
		self.db.query_db(query, data)
