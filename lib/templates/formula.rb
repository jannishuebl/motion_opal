class  < Formotion::Form

  def initialize
    super form
  end

  def form
    {
        sections: [{
                       title: "Register",
                       rows: [{
                                  title: 'Title',
                                  key: :title,
                                  placeholder: 'Title',
                                  type: :string,
                                  auto_correction: :no,
                                  auto_capitalization: :none
                              }]
                   }, {
                       title: "Inventary",
                       rows: [{
                                  title: 'Name',
                                  key: :item,
                                  placeholder: 'Schuhe, Kopf..',
                                  type: :string,
                                  auto_correction: :no,
                                  auto_capitalization: :none
                              }, {
                                  title: 'Add',
                                  key: :add_item,
                                  type: :button
                              }]
                   }]
    }
  end
end
