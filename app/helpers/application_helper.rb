module ApplicationHelper
  def current_class?(test_path)
    return 'inline-flex items-center justify-center h-12 px-6 font-medium tracking-wide text-white rounded bg-gray-900 focus:shadow-outline focus:outline-none dark:hover:bg-gray-800' if request.path == test_path
    'inline-flex items-center justify-center h-12 px-6 font-medium tracking-wide text-white rounded hover:bg-gray-900 focus:shadow-outline focus:outline-none dark:hover:bg-gray-800'
  end

  def current_sidebar_class?(path)
    return 'flex w-full justify-between text-gray-800 font-bold' if request.path == path
    'flex w-full justify-between text-gray-700'
  end
end
