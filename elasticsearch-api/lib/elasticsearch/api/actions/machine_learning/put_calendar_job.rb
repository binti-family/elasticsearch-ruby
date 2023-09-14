# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#
# Auto generated from build hash f284cc16f4d4b4289bc679aa1529bb504190fe80
# @see https://github.com/elastic/elasticsearch/tree/main/rest-api-spec
#
module Elasticsearch
  module API
    module MachineLearning
      module Actions
        # Adds an anomaly detection job to a calendar.
        #
        # @option arguments [String] :calendar_id The ID of the calendar to modify
        # @option arguments [String] :job_id The ID of the job to add to the calendar
        # @option arguments [Hash] :headers Custom HTTP headers
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/current/ml-put-calendar-job.html
        #
        def put_calendar_job(arguments = {})
          request_opts = { endpoint: arguments[:endpoint] || "ml.put_calendar_job" }

          defined_params = [:calendar_id, :job_id].inject({}) do |set_variables, variable|
            set_variables[variable] = arguments[variable] if arguments.key?(variable)
            set_variables
          end
          request_opts[:defined_params] = defined_params unless defined_params.empty?

          raise ArgumentError, "Required argument 'calendar_id' missing" unless arguments[:calendar_id]
          raise ArgumentError, "Required argument 'job_id' missing" unless arguments[:job_id]

          arguments = arguments.clone
          headers = arguments.delete(:headers) || {}

          body = nil

          _calendar_id = arguments.delete(:calendar_id)

          _job_id = arguments.delete(:job_id)

          method = Elasticsearch::API::HTTP_PUT
          path   = "_ml/calendars/#{Utils.__listify(_calendar_id)}/jobs/#{Utils.__listify(_job_id)}"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers, request_opts)
          )
        end
      end
    end
  end
end
