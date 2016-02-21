user = User.create :email => 'mary@seed.com', :password => 'seedpassword'

Stage.create [ {:name => 'Initiation'},
			   {:name => 'Design'},
			   {:name => 'Development'},
			   {:name => 'Integration Testing'},
			   {:name => 'UAT'},
			   {:name => 'Deployment'},
			   {:name => 'Archive'}]
