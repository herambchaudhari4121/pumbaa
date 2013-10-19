'''
Created on Oct 11, 2013

@author: boatkrap
'''

def manager_include(config):
    config.add_route('manager.users.approve', '/users/approve')
    config.add_route('manager.users.do_approve', '/users/approve/{user_id}')

def forums_include(config):
    
    config.add_route('forums.tags.list_tags', '/topics/tags')
    config.add_route('forums.tags.list_contents', '/topics/tags/{name}')
    
    config.add_route('forums.topics.index', '/topics')
    config.add_route('forums.topics.compose', '/topics/compose')
    config.add_route('forums.comments.comment', '/topics/{topic_id}/comment')
    config.add_route('forums.comments.replies', '/topics/{topic_id}/comment/${comment_id}')
    config.add_route('forums.topics.view', '/topics/{topic_id}/{title}')

def add_routes(config):
    config.add_route('index', '/')
    
    # account routes
    config.add_route('register', '/register')
    config.add_route('home', '/home')
    config.add_route('login', '/login')
    config.add_route('logout', '/logout')
    config.add_route('accounts.change_username', '/accounts/change_username')

    # add manager route
    config.add_route('manager.index', '/manager')
    config.include(manager_include, route_prefix='/manager')
    
    # add forums
    config.add_route('forums.index', '/forums')
    config.include(forums_include, route_prefix='/forums')
    
    config.add_static_view('public', 'public', cache_max_age=3600)
    