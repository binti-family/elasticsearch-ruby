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

module Elasticsearch
  module API
    module MachineLearning
      module Actions
        # Creates part of a trained model definition
        # This functionality is Experimental and may be changed or removed
        # completely in a future release. Elastic will take a best effort approach
        # to fix any issues, but experimental features are not subject to the
        # support SLA of official GA features.
        #
        # @option arguments [String] :model_id The ID of the trained model for this definition part
        # @option arguments [Integer] :part The part number
        # @option arguments [Hash] :headers Custom HTTP headers
        # @option arguments [Hash] :body The trained model definition part (*Required*)
        #
        # @see https://www.elastic.co/guide/en/elasticsearch/reference/8.1/put-trained-model-definition-part.html
        #
        def put_trained_model_definition_part(arguments = {})
          raise ArgumentError, "Required argument 'body' missing" unless arguments[:body]
          raise ArgumentError, "Required argument 'model_id' missing" unless arguments[:model_id]
          raise ArgumentError, "Required argument 'part' missing" unless arguments[:part]

          headers = arguments.delete(:headers) || {}

          body = arguments.delete(:body)

          arguments = arguments.clone

          _model_id = arguments.delete(:model_id)

          _part = arguments.delete(:part)

          method = Elasticsearch::API::HTTP_PUT
          path   = "_ml/trained_models/#{Utils.__listify(_model_id)}/definition/#{Utils.__listify(_part)}"
          params = {}

          Elasticsearch::API::Response.new(
            perform_request(method, path, params, body, headers)
          )
        end
      end
    end
  end
end
