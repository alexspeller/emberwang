class LibrariesController < ApplicationController
  def show
    library = params[:id] + '.js'
    libraries = Pathname.glob(Rails.root.join("libraries/*")).map(&:basename)
    if (file = libraries.detect{|l| l.to_s == library})
      send_file Rails.root.join('libraries', file), type: "application/javascript"
    else
      render text: "Not found", status: 404
    end
  end
end
