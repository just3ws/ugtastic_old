port ENV['PORT'] || 3000
environment ENV['RACK_ENV'] || 'development'

workers Integer(ENV['WORKERS'] || 2)
threads Integer(ENV['MIN_THREADS'] || 0), Integer(ENV['MAX_THREADS'] || 16)
