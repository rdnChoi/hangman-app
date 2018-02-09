# Application API
defmodule Hangman.Application do
  use Application 

  def start(_type, _args) do
    # Supervisor.Spec Depreciated! use Supervisor behaviour instead.
    import Supervisor.Spec

    children = [  
      worker(Hangman.Server, []),
    ]
    
    options = [
      name: Hangman.Supervisor,
      strategy: :simple_one_for_one,
    ]
    
    Supervisor.start_link(children, options)
  end
  
end