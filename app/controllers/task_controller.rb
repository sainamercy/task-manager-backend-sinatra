class TaskController < AppController

    # @method: Add a new TASK to the DB
    post '/tasks/create' do
        begin
            task = Task.create( self.data(create: true) )
            json_response(code: 201, data: task)
        rescue => e
            json_response(code: 422, data: { error: e.message })
        end
    end

    # @method: Display all tasks
    get '/tasks' do
        user_id = get_user_id
        tasks = Task.all.filter { |task| task.user_id == user_id.to_i}
    
        json_response(data: tasks)
    end

    # @method: Update existing TASK according to :id
    put '/tasks/update/:id' do
        begin
            task = Task.find(self.helper_id)
            task.update(self.data)
            json_response(data: { message: "task updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete TASK based on :id
    delete '/tasks/destroy/:id' do
        begin
            task = Task.find(self.helper_id)
            task.destroy
            json_response(data: { message: "todo deleted successfully" })
        rescue => e
          json_response(code: 422, data: { error: e.message })
        end
    end


    private

    # @helper: format body data
    def data(create: false)
        payload = JSON.parse(request.body.read)

        payload
    end

    # @helper: retrieve task :id
    def helper_id
        params['id'].to_i
    end

    # @helper: retrieve  user id
    def  get_user_id
     request.env['HTTP_X_USER_ID']
    end
end