Batcave.controllers :vehicles do
  get :index do
    ["batmobile", "batwing"]
  end
end

Batcave.controllers :weapons do
  get :batarang do
    batarang
  end
end