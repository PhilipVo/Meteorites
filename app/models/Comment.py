from __future__ import print_function
from system.core.model import Model
import sys

class Comment(Model):
	def __init__(self):
		super(Comment, self).__init__()

	def get_comment(self, comment_id):
		query = """SELECT *, comments.id AS id, comments.user_id AS user_id,
							DATE_FORMAT(comments.created_at, '%M %D, %Y (%l:%i %p)') AS comment_date 
							FROM comments LEFT JOIN messages ON message_id = messages.id
							LEFT JOIN users ON comments.user_id = users.id WHERE comments.id = :comment_id
							ORDER BY comments.created_at ASC
						"""
		data = {'comment_id': comment_id}
		return self.db.query_db(query, data)[0]		

	def get_event_comments(self, event_id):
		query = """SELECT *, comments.id AS id, comments.user_id AS user_id,
							DATE_FORMAT(comments.created_at, '%M %D, %Y (%l:%i %p)') AS comment_date 
							FROM comments LEFT JOIN messages ON message_id = messages.id
							LEFT JOIN users ON comments.user_id = users.id WHERE event_id = :event_id
							ORDER BY comments.created_at ASC
						"""
		data = {'event_id': event_id}
		return self.db.query_db(query, data)	

	def post_comment(self, message_id, user_id, dat):
		query = """INSERT INTO comments (user_id, message_id, comment, created_at, updated_at)
							VALUES (:user_id, :message_id, :comment, NOW(), NOW())
						"""
		data = {	'user_id': user_id,
							'message_id': message_id,
							'comment': dat['comment']
						}
		return self.db.query_db(query, data)

	def delete_comment(self, id):
		query = "DELETE FROM comments where id = :id"
		data = {'id': id}
		self.db.query_db(query, data)

	def delete_message_comments(self, message_id):
		query = "DELETE FROM comments where message_id = :message_id"
		data = {'message_id': message_id}
		self.db.query_db(query, data)

	def delete_user_comments(self, user_id):
		query = "DELETE FROM comments where user_id = :user_id"
		data = {'user_id': user_id}
		self.db.query_db(query, data)		

