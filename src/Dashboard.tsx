import React from "react";

const MenuItem: React.FC<{ text: string }> = ({ text }) => (
  <div className="p-2 hover:bg-green-200 cursor-pointer rounded">{text}</div>
);

const Card: React.FC<{ title: string; description: string }> = ({ title, description }) => (
    <div className="bg-green-100 rounded shadow-md w-64 p-4">
      <h3 className="font-bold mb-2">{title}</h3>
      <p>{description}</p>
    </div>
);

export const Dashboard: React.FC = () => {
  return (
    <div className="flex flex-col h-screen">
        {/* Header */}
        <header className="flex justify-between items-center bg-green-300 p-4">
            <h1 className="font-bold text-xl">Myapp</h1>
            <nav className="flex gap-6">
                <MenuItem text="Home" />
                <MenuItem text="About" />
                <MenuItem text="Contact" />
            </nav>
        </header>
        {/* Body */}
        <div className="flex flex-1 overflow-hidden">
            {/* Sidebar */}
            <aside className="flex flex-col bg-green-200 w-48 p-4">
                <MenuItem text="Dashboard" />
                <MenuItem text="Settings" />
                <MenuItem text="Profile" />
                <MenuItem text="Logout" />
            </aside>
            <main className="flex flex-col flex-1 p-6 bg-green-50 overflow-auto gap-6">
                <h2 className="text-2xl font-bold">Welcome to your dashboard</h2>
                <div className="flex flex-wrap gap-6">
                    <Card title="Users" description="Manage user accounts and permissions." />
                    <Card title="Analytics" description="View detailed usage statistics." />
                    <Card title="Messages" description="Check your inbox and send messages." />
                    <Card title="Settings" description="Adjust your preferences." />
                </div>
            </main>
        </div>
    </div>
  );
};