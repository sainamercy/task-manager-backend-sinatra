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
        tasks = Task.all
        json_response(data: tasks)
    end

    # @method: Update existing TASK according to :id
    put '/tasks/update/:id' do
        begin
            task = Task.find(self.task_id)
            task.update(self.data)
            json_response(data: { message: "task updated successfully" })
        rescue => e
            json_response(code: 422 ,data: { error: e.message })
        end
    end

    # @method: Delete TASK based on :id
    delete '/tasks/destroy/:id' do
        begin
            task = Task.find(self.task_id)
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
    def task_id
        params['id'].to_i
    end

end