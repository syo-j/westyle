module ApplicationHelper
	def default_meta_tags
	    {
	      site: 'WESTYLE',
	      title: 'TOP',
	      reverse: true,
	      charset: 'utf-8',
	      separator: '|',
	      description: '初学者がRuby on Railsでファッションに特化したSNSを制作、これからはファッションはSNSでも楽しむ時代',
	      keywords: 'Rails,Ruby,プログラミング,ファッション',
	      canonical: request.original_url,
	      noindex: ! Rails.env.production?,
	      icon: [
	        { href: image_url('favicon.ico') },
	        { href: image_url('logo.png'), rel: 'apple-touch-icon', sizes: '180x100', type: 'image/jpg' },
	      ],
	      og: {
	        site_name: :site,
	        title: :title,
	        description: :description, 
	        type: 'website',
	        url: request.original_url,
	        image: image_url('logo.png'),
	        locale: 'ja_JP',
	      },
	      twitter: {
	        card: 'summary_large_image',
	        site: '@TGHmqnVvvgRgLyR',
	      }
	      # fb: {
	      #   app_id: '自身のfacebookのapplication ID'
	      # }
	    }
	end

	# devise
	# def resource_name
	# 	:user
	# end

	# def resource
	# 	@resource ||= User.new
	# end

	# def resource_class
	# 	User
	# end

	# def devise_mapping
	# 	@devise_mapping ||= Devise.mappings[:user]
	# end
end
