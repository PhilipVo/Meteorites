from system.core.router import routes

routes['default_controller'] = 'Users'
routes['GET']['/dashboard'] = 'Users#dashboard'
routes['GET']['/logout'] = 'Users#logout'
routes['POST']['/login_user'] = 'Users#login_user'
routes['POST']['/register_user'] = 'Users#register_user'

# Events
# routes['GET']['/events/view/<int:event_id>'] = 'Events#view'
# routes['POST']['/events/<int:event_id>'] = 'Events#event'

# Messages
# routes['GET']['/messages/get_messages_partial/<int:event_id>'] = 'Messages#get_messages_partial'
routes['POST']['/messages/post_message/<int:event_id>'] = 'Messages#post_message'
routes['POST']['/messages/delete_message/<int:event_id>/<int:message_id>'] = 'Messages#delete_message'
# Comments
routes['POST']['/comments/post_comment/<int:event_id>/<int:message_id>'] = 'Comments#post_comment'
routes['POST']['/comments/delete_comment/<int:event_id>/<int:comment_id>'] = 'Comments#delete_comment'