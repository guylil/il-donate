# Welcome to IL-Donate project 


 - First you can see the project @ [IL-Donate](https://jgive.guylilian.com)


### What we have here?
 
- A ruby on rails project, using partials (html.erb) and tailwind-css
- Local development using sqlite

#### Development
- Use the Dockerfile.development
  - Just build the docker container with `docker build -t ror-dev:v0.1 -f Dockerfile.development .`
  - And run the docker container with `docker run -it --rm -v .:/app -p 3000:3000 ror-dev:v0.1`
  - This will mount the current dir to the container and the Dev server will run and will reload on save (including tailwindcss changes)
  - You can see the local server on http://localhost:3000/

#### Production
- In order to run in production use the Dockerfile or Dockerfile.vercel (they are the same)
- you will need ENV variables for production
  - SECRET_KEY_BASE - you can generate one with `bin/rails secret`
  - DATABASE_URL - with your production db string
  - RAILS_SERVE_STATIC_FILES = true


##### Key decisions / Trade-offs etc:
- The main thing I would do next is to clean the code more:
  - use more components manner partials
  - I would implement a  [ruby-shadcn](https://shadcn.rails-components.com/) in the project to make the components mangamnet easier
  - I would also create a tailwind css main theme that can be used over all the project
  - I would write tests
