# How to Connect Your Azure AI Foundry Agent to NomadIT

Integrating an Azure AI agent into your website requires connecting our JavaScript frontend to your Azure OpenAI resource. The logic is already written in `script.js`; you just need to plug in your specific credentials!

Here is the step-by-step guide to get it fully operational:

## Step 1: Set up Azure AI Foundry
1. Log into the [Azure Portal](https://portal.azure.com/).
2. Search for **Azure OpenAI** and create a new resource (e.g., named `nomadit-ai-resource`).
3. Once the resource is created, open it and click the button to go to the **Azure AI Foundry portal** (formerly Azure AI Studio).

## Step 2: Deploy Your Model (The "Agent")
1. In Azure AI Foundry, navigate to the **Deployments** tab on the left sidebar.
2. Click **Create new deployment**.
3. Select a base model. (We highly recommend `gpt-4o` or `gpt-4` for advanced function calling, though `gpt-35-turbo` works for basic chat).
4. Give your deployment a name. **This name will be your `AGENT_ID`**. (For example, name it `nomadit-support-agent`).

## Step 3: Get Your Credentials
You need three specific pieces of information from Azure to connect the script:

1. **AZURE_ENDPOINT**: Go to your Azure OpenAI resource in the main Azure Portal. Under **Keys and Endpoint**, copy the Endpoint. It should look like this:
   * `https://nomadit-ai-resource.openai.azure.com` *(Do not include any trailing slashes or extra paths).*
2. **API_KEY**: On that exact same page, copy **Key 1**.
3. **AGENT_ID**: This is the Deployment Name you chose in Step 2.

## Step 4: Update `script.js`
Open `script.js` in your code editor and scroll down to the `--- AZURE AI FOUNDRY AGENT CONFIGURATION ---` comment block. 

Update the variables with the credentials you copied:

```javascript
const AZURE_ENDPOINT = "https://YOUR-RESOURCE-NAME.openai.azure.com"; 
const API_KEY = "your-super-secret-api-key-here";
const AGENT_ID = "nomadit-support-agent"; // Your Deployment Name
const API_VERSION = "2024-05-01-preview"; // Leave this as is!
```

Once you save the file, the chat widget on the website will immediately start communicating with your live Azure AI!

---

> [!CAUTION]
> **Production Security Warning**
> 
> Currently, the API call is happening directly in `script.js` (the front-end). This means anyone can view your source code in their browser and steal your `API_KEY`. 
> 
> **Before launching NomadIT to the public**, you must move this logic to a backend server. 
> You would create a simple server API (using Node.js, Python, or Azure Functions) that holds the API key secretly. Your website's `script.js` would then send the user's message to *your* server, and your server would talk to Azure AI Foundry.
