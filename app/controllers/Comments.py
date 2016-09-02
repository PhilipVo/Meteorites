from system.core.controller import *

class Comments(Controller):
	def __init__(self, action):
		super(Comments, self).__init__(action)
		self.load_model('Comment')
		self.load_model('Message')
		self.db = self._app.db

	########## GET ##########

	########## POST ##########
	def post_comment(self, event_id, message_id):
		self.models['Comment'].post_comment(message_id, session['id'], request.form)
		return redirect('/messages/get_messages_partial/{}'.format(event_id))


	def delete_comment(self, event_idcomment_id):
		self.models['Comment'].delete_comment(comment_id)
		return redirect('/messages/get_messages_partial/{}'.format(event_id))
