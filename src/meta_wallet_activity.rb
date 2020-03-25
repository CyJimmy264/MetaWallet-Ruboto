require 'ruboto/widget'
require 'ruboto/util/toast'

ruboto_import_widgets :ImageView, :Button, :LinearLayout, :TextView

class MetaWalletActivity
  def onCreate(bundle)
    super
    set_title 'MetaWallet Ruboto'

    self.content_view =
      linear_layout :orientation => :vertical do
        image_view :image_resource => $package::R::drawable::ic_launcher,
                   :scale_type => ImageView::ScaleType::FIT_CENTER,
                   :layout => {
                     :weight= => 1,
                     :height= => :fill_parent,
                     :width= => :fill_parent
                   }
        @text_view = text_view :text => 'You have not got any wallets yet.',
                               :id => 42,
                               :layout => {:width => :match_parent},
                               :gravity => :center,
                               :text_size => 24.0
        button :text => 'Create Wallet',
               :layout => {:width => :match_parent},
               :id => 43,
               :on_click_listener => proc { butterfly }
      end
  rescue Exception
    puts "Exception creating activity: #{$!}"
    puts $!.backtrace.join("\n")
  end

  private

  def butterfly
    @text_view.text = 'What hath Matz wrought!'
    toast 'Flipped a bit via butterfly'
  end

end
