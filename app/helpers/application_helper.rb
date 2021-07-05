module ApplicationHelper
  def current_class?(test_path)
    return 'inline-flex items-center justify-center h-12 px-6 font-medium tracking-wide text-white rounded bg-gray-900 focus:shadow-outline focus:outline-none dark:hover:bg-gray-800' if request.path == test_path
    'inline-flex items-center justify-center h-12 px-6 font-medium tracking-wide text-white rounded hover:bg-gray-900 focus:shadow-outline focus:outline-none dark:hover:bg-gray-800'
  end
end
