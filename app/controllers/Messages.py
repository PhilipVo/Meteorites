from __future__ import print_function
import sys
from system.core.controller import *

class Messages(Controller):
	def __init__(self, action):
		super(Messages, self).__init__(action)
		self.load_model('Event')
		self.load_model('User')
		self.load_model('Message')
		self.load_model('Comment')
		self.db = self._app.db

	########## GET ##########
	def get_messages_partial(self, event_id):
		print('event_id', file=sys.stderr)
		print(event_id, file=sys.stderr)
		event = self.models['Event'].get_event(event_id, session['id'])
		users = self.models['User'].get_event_users(event_id)
		messages = self.models['Message'].get_event_messages(event_id)
		locations_list = self.models['Message'].get_event_locations(event_id)
		locations = []
		for location in locations_list:
			locations.append(location['location'])
		locations = json.dumps(locations)
		comments = self.models['Comment'].get_event_comments(event_id)
		return self.load_view('partials/messages.html', event=event, users=users, messages=messages, locations=locations, comments=comments)


	########## POST ##########
	def post_message(self, event_id):
		self.models['Message'].post_message(event_id, session['id'], request.form)	
		return redirect('/messages/get_messages_partial/{}'.format(event_id))

	def delete_message(self, event_id, message_id):
		self.models['Comment'].delete_message_comments(message_id)
		self.models['Message'].delete_message(message_id)
		return redirect('/messages/get_messages_partial/{}'.format(event_id))
