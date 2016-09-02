from __future__ import print_function
import sys, json
from system.core.controller import *

class Events(Controller):
	def __init__(self, action):
		super(Events, self).__init__(action)
		self.load_model('Event')
		self.load_model('User')
		self.load_model('Message')
		self.load_model('Comment')
		self.db = self._app.db

	############### GET ###################
	def view(self, event_id):
		if session.get('id'):
			event = self.models['Event'].get_event(event_id, session['id'])
			users = self.models['User'].get_event_users(event_id)
			messages = self.models['Message'].get_event_messages(event_id)
			locations_list = self.models['Message'].get_event_locations(event_id)
			locations = []
			for location in locations_list:
				locations.append(location['location'])
			locations = json.dumps(locations)
			comments = self.models['Comment'].get_event_comments(event_id)
			return self.load_view('view.html', event=event, users=users, messages=messages, locations=locations, comments=comments)
		return redirect('/')

	############### POST ###################
	def index(self, event_id):
		self.models['Event'].toggle_join(session['id'], event_id)
		return redirect('/')
