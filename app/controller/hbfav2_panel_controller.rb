# -*- coding: utf-8 -*-
class HBFav2PanelController < JASidePanelController
  def self.sharedController
    Dispatch.once { @instance ||= new }
    @instance
  end

  def stylePanel(panel)
  end

  def presentViewController(controller)
    if self.centerPanel.presentedViewController.nil?
      self.centerPanel.presentViewController(controller, animated:true, completion:nil)
    else
      self.centerPanel.dismissViewControllerAnimated(true, completion:
        lambda { self.centerPanel.presentViewController(controller, animated:true, completion:nil) }
      )
    end
  end
end
