Brainstorming


Users
id
uid:string index
oauth_token:string
provider: string
oauth_expires_at:datetime
gender
first_name
last_name
short_bio
image
email
zipcode
phone_number
instrument
level
video_link
group_type_preferences
style_preferences
availability

Requests (join table)
user_id
group_id
user_approved
group_approved
finalized (default nil, t/f(don't even show))
part

Groups
id
name
level
admin?
type
parts
complete

pieces
id
name
composer
type
level

parts
id
name





