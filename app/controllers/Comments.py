from system.core.controller import *

class Comments(Controller):
	def __init__(self, action):
		super(Comments, self).__init__(action)
		self.load_model('Comment')
		self.load_model('Message')
		self.db = self._app.db

	########## GET ##########
	def get_comment_partial(self, comment_id):
		comment = self.models['Comment'].get_comment(comment_id)
		return self.load_view('partials/comment.html', comment=comment)


	########## POST ##########
	def post_comment(self, message_id):
		comment_id = self.models['Comment'].post_comment(message_id, session['id'], request.form)
		return redirect('/comments/get_comment_partial/{}'.format(comment_id))


	# def delete_comment(self, comment_id):
	# 	self.models['Comment'].delete_comment(comment_id)
	# 	return redirect('/comments/get_comment_partial/{}'.format(event_id))
