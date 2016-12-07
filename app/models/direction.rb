class Direction < ApplicationRecord
  belongs_to :recipe

  has_attached_file :attachment, styles: {
	  medium: {geometry: "640x480>", format:'mp4', convert_options: {
      input: {},
      output: {
        vcodec: 'libx264',
        movflags: '+faststart',
        strict: :experimental
      }
  	}
	},
		thumb: {geometry: "100x100#", format:'jpg', time: 10}
	}, processors: [:transcoder]

	validates_attachment_content_type :attachment, content_type: ["video/mp4", "video.mov", "video/mpeg","video/mpeg4"]
	validates_attachment :attachment, size: {less_than: 130.megabytes}

  has_attached_file :dir_image, styles: { medium: "500x500>" }
  validates_attachment_content_type :dir_image, content_type: /\Aimage\/.*\z/

end
