



api = {}


api.nav_edit_profile = ({ state, action }) ->
    state.set 'navi', 'edit_profile'

api.nav_ufo = ({ state, action }) ->
    state.set 'navi', 'ufo'


api.nav_login = ({ state, action }) ->
    state.set 'navi', 'login'

api.nav_register = ({ state, action }) ->
    state.set 'navi', 'register'









exports.default = api
