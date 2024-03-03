-- Define the panic button object
local panicButton = script.Parent

-- Function to send notification to the police
local function sendNotificationToPolice()
    -- Example: Send a notification to the police
    print("Panic button activated! Sending notification to the police...")

    -- Example: Simulate sending a notification to the police (replace this with your notification logic)
    local policeStation = "123 Main St" -- Replace with the address of the police station
    local message = "Emergency! Panic button activated at home address: " .. panicButton.Parent.Name
    print("Notification sent to the police station at " .. policeStation .. ": " .. message)
end

-- Connect the panic button to the sendNotificationToPolice function when clicked
panicButton.ClickDetector.MouseClick:Connect(sendNotificationToPolice)
