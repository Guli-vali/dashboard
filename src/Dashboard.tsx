import React from "react";


const Item = ({ title, description }: { title: string; description: string }) => {
  return (
    <div className="bg-green-100 rounded p-4 shadow-md">
      <p className="font-bold">{title}</p>
      <p>{description}</p>
    </div>
  );
}

export const Dashboard: React.FC = () => {
  return (
    <div className="flex flex-col">
        <header className="flex justify-between items-center h-14 bg-green-300 px-4">
            <h1 className="font-bold">Myapp</h1>
            <nav className="flex gap-8">
                <div>Home</div>
                <div>About</div>
                <div>Contact</div>
            </nav>
        </header>
        <div className="flex bg-green-50 h-screen">
            <aside className="flex flex-col bg-green-200 gap-4 py-4 pl-4 pr-15 items-start">
                <div>Dashboard</div>
                <div>Settings</div>
                <div>Profile</div>
                <div>Logout</div>
            </aside>
            <div className="flex flex-col flex-1">
                <h1 className="text-xl font-bold p-4">Welcome to your dashboard</h1>
                <div className="flex overflow-scroll flex-wrap gap-4 p-4">
                    <Item title="Users" description="Manage user accounts and permissions." />
                    <Item title="Analytics" description="View detailed usage statistics." />
                    <Item title="Messages" description="Check your inbox and send messages." />
                    <Item title="Settings" description="Adjust your preferences." />
                </div>
            </div>
        </div>
    </div>
  );
};