// Copyright (c) 2023 WSO2 LLC. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

# Returns the application properties by its name
#
# + message - Represents a message that contains application properties
# + name - Represents the name of the application property that the user wants to retrieve.
# + return - Returns null if the requested property does not exist
public isolated function getApplicationPropertyByName(Message message, string name) returns any|error? {
        ApplicationProperties applicationPropertiesResult = check message.applicationProperties.ensureType();
        map<any> properties = check applicationPropertiesResult.properties.ensureType();
        return properties[name];
}
