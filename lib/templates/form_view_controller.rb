class  < Formotion::FormController

  def init
    super.initWithForm .new
    # insert code
    self
  end

  def viewDidLoad
    super
    set_nav_bar_items
  end

  def set_nav_bar_items
    self.title = 'Create List'
    create_button = UIBarButtonItem.alloc.initWithTitle('Create', style: UIBarButtonItemStyleBordered, target: self, action: 'create_new_list')
    self.navigationItem.rightBarButtonItem = create_button
  end

  def viewDidUnload
    super
  end

  def shouldAutorotateToInterfaceOrientation(interfaceOrientation)
    interfaceOrientation == UIInterfaceOrientationPortrait
  end

end
